// This file is part of SWGANH which is released under the MIT license.
// See file LICENSE or go to http://swganh.com/LICENSE

#ifndef SWGANH_OBJECT_CREATURE_CREATURE_BINDING_H_
#define SWGANH_OBJECT_CREATURE_CREATURE_BINDING_H_

#include "swganh_core/object/creature/creature.h"
#include "swganh_core/object/tangible/tangible.h"

#include <boost/python.hpp>

using namespace boost::python;
using namespace std;
using namespace swganh::object;

void exportCreature()
{
	// ENUMS
	enum_<Posture>("POSTURE", "The Possible postures a creature can be in")
		.value("UPRIGHT", UPRIGHT)
		.value("CROUCHED", CROUCHED)
		.value("PRONE", PRONE)
		.value("SNEAKING", SNEAKING)
		.value("BLOCKING", BLOCKING)
		.value("CLIMBING", CLIMBING)
		.value("LYING_DOWN", LYING_DOWN)
		.value("SITTING", SITTING)
		.value("SKILL_ANIMATING", SKILL_ANIMATING)
		.value("DRIVING_VEHICLE", DRIVING_VEHICLE)
		.value("RIDING_CREATURE", RIDING_CREATURE)
		.value("KNOCKED_DOWN", KNOCKED_DOWN)
		.value("INCAPACITATED", INCAPACITATED)
		.value("DEAD", DEAD)
		;

	enum_<State>("ACTION", "State Bitmask, the creature can be in multiple of these")
		.value("NONE", NONE)
		.value("COVER", COVER)
		.value("COMBAT", COMBAT)
		.value("PEACE", PEACE)
		.value("AIMING", AIMING)
		.value("ALERT", ALERT)
		.value("BERSERK", BERSERK)
		.value("FEIGN_DEATH", FEIGN_DEATH)
		.value("COMBAT_ATTITUDE_EVASIVE", COMBAT_ATTITUDE_EVASIVE)
		.value("COMBAT_ATTITUDE_NORMAL", COMBAT_ATTITUDE_NORMAL)
		.value("COMBAT_ATTITUDE_AGGRESSIVE", COMBAT_ATTITUDE_AGGRESSIVE)
		.value("TUMBLING", TUMBLING)
		.value("RALLIED", RALLIED)
		.value("STUNNED", STUNNED)
		.value("BLINDED", BLINDED)
		.value("DIZZY", DIZZY)
		.value("INTIMIDATED", INTIMIDATED)
		.value("IMMOBILIZED", IMMOBILIZED)
		.value("FROZEN", FROZEN)
		.value("SWIMMING", SWIMMING)
		.value("SITTING_ON_CHAIR", SITTING_ON_CHAIR)
		.value("CRAFTING", CRAFTING)
		.value("GLOWING_JEDI", GLOWING_JEDI)
		.value("MASK_SCENT", MASK_SCENT)
		.value("POISONED", POISONED)
		.value("BLEEDING", BLEEDING)
		.value("DISEASED", DISEASED)
		.value("ON_FIRE", ON_FIRE)
		.value("RIDING_MOUNT", RIDING_MOUNT)
		.value("MOUNTED_CREATURE", MOUNTED_CREATURE)

		//@TODO: NEED TO FIND OUT HOW TO GET BOOST PYTHON TO ALLOW UINT64_T VALUES
		/*.value("PILOTING_SHIP", PILOTING_SHIP)
		.value("SHIP_OPERATIONS", SHIP_OPERATIONS)
		.value("SHIP_GUNNER", SHIP_GUNNER)
		.value("SHIP_INTERIOR", SHIP_INTERIOR)
		.value("PILOTING_POB_SHIP", PILOTING_POB_SHIP)*/
		;
	enum_<PvpStatus>("PVPSTATUS", "The PvPStatus of the creature, this controls if a creature is attackable.")
		.value("PvPStatus_None", PvPStatus_None)
		.value("PvPStatus_Attackable", PvPStatus_Attackable)
		.value("PvPStatus_Aggressive", PvPStatus_Aggressive)
		.value("PvPStatus_Overt", PvPStatus_Overt)
		.value("PvPStatus_Tef", PvPStatus_Tef)
		.value("PvPStatus_Player", PvPStatus_Player)
		.value("PvPStatus_Enemy", PvPStatus_Enemy)
		.value("PvPStatus_Duel", PvPStatus_Duel)
		;
	enum_<StatIndex>("STATS", "The different stats a creature can have")
		.value("HEALTH", HEALTH)
		.value("STRENGTH", STRENGTH)
		.value("CONSTITUTION", CONSTITUTION)
		.value("ACTION", ACTION)
		.value("QUICKNESS", QUICKNESS)
		.value("STAMINA", STAMINA)
		.value("MIND", MIND)
		.value("FOCUS", FOCUS)
		.value("WILLPOWER", WILLPOWER)
		;

	class_<EquipmentItem>("EquipmentItem", "The Equipment Object")
		.def(init<uint64_t, uint32_t, std::string, uint32_t>())
		.def_readwrite("object_id", &EquipmentItem::object_id)
		.def_readwrite("template_crc", &EquipmentItem::template_crc)
		.def_readwrite("customization", &EquipmentItem::customization)
		.def_readwrite("containment_type", &EquipmentItem::containment_type)
		;
	class_<SkillMod>("SkillMod", "The Skill Mod Object")
		.def(init<std::string, uint32_t, uint32_t>())
		.def_readwrite("identifier", &SkillMod::identifier)
		.def_readwrite("base", &SkillMod::base)
		.def_readwrite("modifier", &SkillMod::modifier)
		.def("__eq__", &SkillMod::operator==)
		;
	class_<Creature, bases<Tangible>, std::shared_ptr<Creature>, boost::noncopyable>("Creature", "Object that describes the creature object, child of Tangible")
		// STATS
		.def("set_stat_base", &Creature::SetStatBase, "sets the base :class:`.STATS` value")
		.def("add_stat_base", &Creature::AddStatBase, "adds to the given :class:`.STATS`")
		.def("deduct_stat_base", &Creature::DeductStatBase, "deducts from the :class:`.STATS`")
		.def("get_stat_base", &Creature::GetStatBase, "gets the value of the :class:`.STATS`")
		.def("set_stat_current", &Creature::SetStatCurrent, "sets the current :class:`.STATS`")
		.def("add_stat_current", &Creature::AddStatCurrent, "adds to the given :class:`.STATS`")
		.def("deduct_stat_current", &Creature::DeductStatCurrent, "deducts from the current :class:`.STATS`")
		.def("get_stat_current", &Creature::GetStatCurrent, "gets the value of the current :class:`.STATS`")
		.def("add_stat_wound", &Creature::AddStatWound, "adds to the given wound :class:`.STATS`")
		.def("deduct_stat_wound", &Creature::DeductStatWound, "deducts from the given wound :class:`.STATS`")
		.def("get_stat_wound", &Creature::GetStatWound, "gets the value of the current wound :class:`.STATS`")
		.def("add_stat_encumberance", &Creature::AddStatEncumberance, "adds to the given encumberance :class:`.STATS`")
		.def("deduct_stat_encumberance", &Creature::DeductStatEncumberance, "deducts from the given encumberance :class:`.STATS`")
		.def("get_stat_encumberance", &Creature::GetStatEncumberance, "gets the value of the current encumberance :class:`.STATS`")
		.def("set_stat_max", &Creature::SetStatMax, "sets the given MAX :class:`.STATS`")
		.def("add_stat_max", &Creature::AddStatMax, "adds to the given MAX :class:`.STATS`")
		.def("deduct_stat_max", &Creature::DeductStatMax, "deducts from the given MAX :class:`.STATS`")
		.def("get_stat_max", &Creature::GetStatMax, "gets the value of the current MAX :class:`.STATS`")
		//
		.def("add_skill", &Creature::AddSkill, "adds skill to the creature")
		.def("remove_skill", &Creature::RemoveSkill, "removes skill from the creature")
		.def("has_skill", &Creature::HasSkill, "returns true if the creature has the skill")
		.def("add_skill_mod", &Creature::AddSkillMod, "adds skill mod to the creature")
		.def("remove_skill_mod", &Creature::RemoveSkillMod, "removes skill mod from the creature")
		.def("get_skill_mod", &Creature::GetSkillMod, "gets the current value of the skill mod")
		.add_property("bank_credits", &Creature::GetBankCredits, &Creature::SetBankCredits, "Gets and Sets the credits that a creature has in their bank")
		.add_property("cash_credits", &Creature::GetCashCredits, &Creature::SetCashCredits, "Gets and Sets the credits that a creature has on themselves")
		.add_property("posture", &Creature::GetPosture, &Creature::SetPosture, "Gets and Sets the posture of the creature, :class:`.POSTURE`")
        .def("is_dead", &Creature::IsDead, "returns true if this creature is dead")
        .def("is_incap", &Creature::IsIncapacitated, "returns true if this creature is incapacitated")
        .add_property("faction_rank", &Creature::GetFactionRank, &Creature::SetFactionRank, "Gets and Sets the faction rank for this creature")
		.add_property("owner_id", &Creature::GetOwnerId, &Creature::SetOwnerId, "Gets and Sets the owner id for the creature")
		.add_property("scale", &Creature::GetScale, &Creature::SetScale, "Gets and Sets the scale of the creature 1-10")
		.add_property("battle_fatigue", &Creature::GetBattleFatigue, &Creature::SetBattleFatigue, "Gets and Sets the battle fatigue of the creature")
		.add_property("state_bitmask", &Creature::GetStateBitmask, &Creature::SetStateBitmask, "Gets and Sets the state bitmask see :class:`.ACTION`")
        .def("has_state", &Creature::HasState, "Checks to see if the state :class:`.ACTION` exists in the bitmask")
        .def("toggle_state", &Creature::ToggleStateBitmask, "Toggles the provided :class:`.ACTION` State")
        .def("toggle_state_on", &Creature::ToggleStateOn, "Toggles the provided :class:`.ACTION` State On")
        .def("toggle_state_off", &Creature::ToggleStateOff, "Toggles the provided :class:`.ACTION` State Off")
		.add_property("acceleration_multiplayer_base", &Creature::GetAccelerationMultiplierBase, &Creature::SetAccelerationMultiplierBase, "Gets and Sets the base acceleration multiplier")
		.add_property("acceleration_multiplayer_modifier", &Creature::GetAccelerationMultiplierModifier, &Creature::SetAccelerationMultiplierModifier, "Gets and Sets the acceleration multiplier modifier")
		.add_property("listen_to_id", &Creature::GetListenToId, &Creature::SetListenToId, "Gets and Sets who this creature is listening to, see Entertainer")
		.add_property("run_speed", &Creature::GetRunSpeed, &Creature::SetRunSpeed, "Gets and Sets the run speed of the creature")
		.add_property("slope_modifier_angle", &Creature::GetSlopeModifierAngle, &Creature::SetSlopeModifierAngle, "Gets and Sets the slope modifier angle, used to determine terrain negotiation")
		.add_property("slope_modifier_percent", &Creature::GetSlopeModifierPercent, &Creature::SetSlopeModifierPercent, "Gets and Sets the slope modifier percent, used to determine terrain negotiation")
		.add_property("turn_radius", &Creature::GetTurnRadius, &Creature::SetTurnRadius, "Gets and Sets the turn radius, when using vehicles")
		.add_property("walking_speed", &Creature::GetWalkingSpeed, &Creature::SetWalkingSpeed, "Gets and Sets the default walking speed of the creature")
		.add_property("water_modifier_percent", &Creature::GetWaterModifierPercent, &Creature::SetWaterModifierPercent, "Gets and Sets the water modifier percent")
		.add_property("combat_level", &Creature::GetCombatLevel, &Creature::SetCombatLevel, "Gets and Sets the combat level of the creature")
		.add_property("animation", &Creature::GetAnimation, &Creature::SetAnimation, "Gets and Sets the current animation of the player")
		.add_property("mood_animation", &Creature::GetMoodAnimation, &Creature::SetMoodAnimation, "Gets and Sets the current mood animation of the player")
		.add_property("weapon_id", &Creature::GetWeaponId, &Creature::SetWeaponId, "Gets and Sets the weapon id of the creature")
		.add_property("group_id", &Creature::GetGroupId, &Creature::SetGroupId, "Gets and Sets the current group id of the creature")
		.add_property("invite_sender_id", &Creature::GetInviteSenderId, &Creature::SetInviteSenderId, "Gets and Sets the invite sender id of the last person to send a group invite to the creature")
		.add_property("guild_id", &Creature::GetGuildId, &Creature::SetGuildId, "Gets and Sets the guild id of the creature")
		.add_property("target_id", &Creature::GetTargetId, &Creature::SetTargetId, "Gets and Sets the target of the current creature by id")
		.add_property("mood_id", &Creature::GetMoodId, &Creature::SetMoodId, "Gets and Sets the current mood of the creature")
		.add_property("disguise", &Creature::GetDisguise, &Creature::SetDisguise, "Gets and Sets the disguise of the current creature, this makes the creature look like the given iff file")
		.add_property("stationary", &Creature::SetStationary, &Creature::SetStationary, "Gets and Sets if the creature can move or not")
        .add_property("pvp_status", &Creature::GetPvpStatus, &Creature::SetPvPStatus, "Gets and Sets the :class:`.PVPSTATUS` of the creature")
        .def("in_duel_list", &Creature::InDuelList, "Returns a boolean based on if the creature is currently dueling the target")
        .def("add_duel_list", &Creature::AddToDuelList, "Adds the creature id to the duel list")
        .def("remove_duel_list", &Creature::RemoveFromDuelList, "Removes the creature from the duel list")        
        ;

	implicitly_convertible<std::shared_ptr<Creature>, std::shared_ptr<Tangible>>();
	implicitly_convertible<std::shared_ptr<Creature>, std::shared_ptr<Object>>();
	implicitly_convertible<std::shared_ptr<Creature>, std::shared_ptr<ContainerInterface>>();
}

#endif  //SWGANH_OBJECT_CREATURE_CREATURE_BINDING_H_