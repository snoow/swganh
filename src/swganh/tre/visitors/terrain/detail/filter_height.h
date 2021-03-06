#pragma once

#include "filter_layer.h"

namespace swganh
{
namespace tre
{

	/**
		Height Filter. Used to filter fractal data for the parent container.
		This can be used to keep heights between two particular bounds.
	*/
	class HeightFilter : public FilterLayer
	{
	public:
		
		virtual void Deserialize(swganh::ByteBuffer& buffer);

		virtual float Process(float x, float z, float transform_value, float& base_value, std::map<uint32_t,Fractal*>& fractals);

	private:
		float minHeight, maxHeight;
	};

}
}
