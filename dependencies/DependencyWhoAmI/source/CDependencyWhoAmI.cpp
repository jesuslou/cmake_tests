#include "CDependencyWhoAmI.h"
#include <SFML/Graphics/View.hpp>

const char* CDependencyWhoAmI::TellWhoAmI()
{
	sf::View View;
	View.setViewport(sf::FloatRect(0, (float)10, (float)10, 0));

	return "I am CDependencyTest inheriting from IWhoAmI";
}
