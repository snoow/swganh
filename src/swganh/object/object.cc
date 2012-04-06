
#include "object.h"
#include "object_events.h"

#include "anh/crc.h"
#include "anh/observer/observer_interface.h"
#include "swganh/messages/base_baselines_message.h"
#include "swganh/messages/scene_create_object_by_crc.h"
#include "swganh/messages/scene_end_baselines.h"
#include "swganh/messages/update_containment_message.h"

using namespace anh::observer;
using namespace std;
using namespace swganh::object;
using namespace swganh::messages;

Object::Object()
    : object_id_(0)
    , template_string_("")
    , position_(glm::vec3(0,0,0))
    , orientation_(glm::quat(0,0,0,0))
    , complexity_(0)
    , stf_name_file_("")
    , stf_name_string_("")
    , custom_name_(L"")
    , volume_(0)
{
}

bool Object::HasController()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return controller_ != nullptr;
}

shared_ptr<ObjectController> Object::GetController()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return controller_;
}

void Object::SetController(const shared_ptr<ObjectController>& controller)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        controller_ = controller;
    }

    Subscribe(controller);
}

void Object::ClearController()
{
    shared_ptr<ObjectController> controller;

    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        controller = controller_;
        controller_.reset();
    }

    Unsubscribe(controller);
}

void Object::AddContainedObject(const shared_ptr<Object>& object, ContainmentType containment_type)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        if (contained_objects_.find(object->GetObjectId()) != contained_objects_.end())
        {
            /// @TODO consider whether encountering this scenario is an error
            return;
        }

        contained_objects_.insert(make_pair(object->GetObjectId(), object));
        object->SetContainer(shared_from_this());
    }

    if (HasController())
    {
        object->Subscribe(GetController());
    }
}

bool Object::IsContainerForObject(const shared_ptr<Object>& object)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return contained_objects_.find(object->GetObjectId()) != contained_objects_.end();
}

void Object::RemoveContainedObject(const shared_ptr<Object>& object)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    auto find_iter = contained_objects_.find(object->GetObjectId());

    if (find_iter == contained_objects_.end())
    {
        /// @TODO consider whether encountering this scenario is an error
        return;
    }

    contained_objects_.erase(find_iter);

    if (HasController())
    {
        object->Unsubscribe(GetController());
    }
}

Object::ObjectMap Object::GetContainedObjects()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return contained_objects_;
}

void Object::AddAwareObject(const shared_ptr<Object>& object)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
        if (aware_objects_.find(object->GetObjectId()) == aware_objects_.end())
        {
            aware_objects_.insert(make_pair(object->GetObjectId(), object));
        }
    }
    if (object->HasController()) {
        Subscribe(object->GetController());
        CreateBaselines(object->GetController());
        MakeClean(object->GetController());
    }
}

bool Object::IsAwareOfObject(const shared_ptr<Object>& object)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return aware_objects_.find(object->GetObjectId()) != aware_objects_.end();
}

void Object::RemoveAwareObject(const shared_ptr<Object>& object)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        auto find_iter = aware_objects_.find(object->GetObjectId());

        if (find_iter != aware_objects_.end())
        {
            return;
        }

        aware_objects_.erase(find_iter);
    }

    if (HasController())
    {
        object->Unsubscribe(GetController());
    }
}
string Object::GetTemplate()
{
    std::lock_guard<std::mutex> lock(object_mutex_);
	return template_string_;
}
void Object::SetTemplate(const string& template_string)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
	    template_string_ = template_string;
    }
    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Template",shared_from_this()));
}
void Object::SetObjectId(uint64_t object_id)
{
    std::lock_guard<std::mutex> lock(object_mutex_);
	object_id_ = object_id;
}
uint64_t Object::GetObjectId()
{
    return object_id_;
}

wstring Object::GetCustomName()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return custom_name_;
}

void Object::SetCustomName(wstring custom_name)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
        custom_name_ = custom_name;
    }
    
    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::CustomName",shared_from_this()));
}

bool Object::HasObservers()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return !observers_.empty();
}

void Object::Subscribe(const shared_ptr<ObserverInterface>& observer)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    auto find_iter = std::find_if(
        observers_.begin(),
        observers_.end(),
        [&observer] (const std::shared_ptr<ObserverInterface>& stored_observer)
    {
        return observer == stored_observer;
    });

    if (find_iter != observers_.end())
    {
        return;
    }

    observers_.push_back(observer);
}

void Object::Unsubscribe(const shared_ptr<ObserverInterface>& observer)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    auto find_iter = std::find_if(
        observers_.begin(),
        observers_.end(),
        [&observer] (const std::shared_ptr<ObserverInterface>& stored_observer)
    {
        return observer == stored_observer;
    });

    if (find_iter == observers_.end())
    {
        return;
    }

    observers_.erase(find_iter);
}

void Object::NotifyObservers(const anh::ByteBuffer& message)
{
    NotifyObservers<anh::ByteBuffer>(message);
}

bool Object::IsDirty()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return !deltas_.empty();
}
// TODO: Refactor
void Object::MakeClean(std::shared_ptr<swganh::object::ObjectController> controller)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
        baselines_.clear();
        deltas_.clear();
    }
    // SceneCreateObjectByCrc
    swganh::messages::SceneCreateObjectByCrc scene_object;
    scene_object.object_id = GetObjectId();
    scene_object.object_crc = anh::memcrc(GetTemplate());
    scene_object.position = GetPosition();
	scene_object.orientation = GetOrientation();
    scene_object.byte_flag = 0;
    controller->Notify(scene_object);

    if (GetContainer())
    {
        UpdateContainmentMessage containment_message;
        containment_message.container_id = GetContainer()->GetObjectId();
        containment_message.object_id = GetObjectId();
        containment_message.containment_type = 4;

        controller->Notify(containment_message);
    }
    
    OnMakeClean(controller);
}

BaselinesCacheContainer Object::GetBaselines()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return baselines_;
}

DeltasCacheContainer Object::GetDeltas(uint64_t viewer_id)
{
	std::lock_guard<std::mutex> lock(object_mutex_);
    return deltas_;
}

void Object::AddDeltasUpdate(DeltasMessage message)
{
    NotifyObservers(message);

	std::lock_guard<std::mutex> lock(object_mutex_);
    deltas_.push_back(move(message));
}
void Object::AddBaselineToCache(swganh::messages::BaselinesMessage baseline)
{
    baselines_.push_back(move(baseline));
}
//
//void Object::AddBaselinesBuilders_()
//{
//	std::lock_guard<std::mutex> lock(object_mutex_);
//    baselines_builders_.push_back([this] () {
//        return GetBaseline1();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline2();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline3();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline4();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline5();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline6();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline7();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline8();
//    });
//
//    baselines_builders_.push_back([this] () {
//        return GetBaseline9();
//    });
//}

void Object::SetPosition(glm::vec3 position)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        position_ = position;
    }

    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Position",shared_from_this()));
}
glm::vec3 Object::GetPosition()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
	return position_;
}
bool Object::InRange(glm::vec3 target, float range)
{
	if (glm::distance(GetPosition(), target) > range)
	{
		return false;
	}
	return true;
}
void Object::SetOrientation(glm::quat orientation)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        orientation_ = orientation;
    }

    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Orientation",shared_from_this()));
}
glm::quat Object::GetOrientation()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
	return orientation_;
}

uint8_t Object::GetHeading()
{
    glm::quat tmp;
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        tmp = orientation_;
    }

    if (tmp.y < 0.0f && tmp.w > 0.0f) {
        tmp.w *= -1;
    }

    return static_cast<uint8_t>((glm::angle(tmp) / 6.283f) * 100);
}

void Object::SetContainer(const std::shared_ptr<Object>& container)
{
    {
	    std::lock_guard<std::mutex> lock(object_mutex_);
        container_ = container;
    }

    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Container",shared_from_this()));
}

shared_ptr<Object> Object::GetContainer()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
	return container_;
}

void Object::SetComplexity(float complexity)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
        complexity_ = complexity;
    }
    
    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Complexity",shared_from_this()));
}

float Object::GetComplexity()
{
    std::lock_guard<std::mutex> lock(object_mutex_);
	return complexity_;
}

void Object::SetStfName(const string& stf_file_name, const string& stf_string)
{
    {
        std::lock_guard<std::mutex> lock(object_mutex_);
        stf_name_file_ = stf_file_name;
        stf_name_string_ = stf_string;
    }

    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::StfName",shared_from_this()));
}

string Object::GetStfNameFile()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
	return stf_name_file_;
}

string Object::GetStfNameString()
{
	std::lock_guard<std::mutex> lock(object_mutex_);
	return stf_name_string_;
}

void Object::SetVolume(uint32_t volume)
{
    volume_ = volume;

    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::Volume",shared_from_this()));
}

uint32_t Object::GetVolume()
{
	return volume_;
}

void Object::SetSceneId(uint32_t scene_id)
{
    scene_id_ = scene_id;
        
    GetEventDispatcher()->Dispatch(make_shared<ObjectEvent>
        ("Object::SceneId",shared_from_this()));
}

uint32_t Object::GetSceneId()
{
	return scene_id_;
}

anh::EventDispatcher* Object::GetEventDispatcher()
{
    return event_dispatcher_;
}

void Object::SetEventDispatcher(anh::EventDispatcher* dispatcher)
{
    event_dispatcher_ = dispatcher;
}

void Object::CreateBaselines( std::shared_ptr<ObjectController> controller)
{
    GetEventDispatcher()->Dispatch(make_shared<ControllerEvent>
        ("Object::Baselines", shared_from_this(), controller));
}
