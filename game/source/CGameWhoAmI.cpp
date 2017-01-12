#include "CGameWhoAmI.h"
#include <SFML/Graphics/View.hpp>
#include <entityx/entityx.h>

namespace ex = entityx;

class Application : public ex::EntityX
{
public:
};

const char* CGameWhoAmI::TellWhoAmI()
{
	sf::View View;
	View.setViewport(sf::FloatRect(0, (float)10, (float)10, 0));

	return "I am CGameWhoAmI inheriting from IWhoAmI";
}
