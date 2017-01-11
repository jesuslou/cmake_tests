#pragma once

#include "IWhoAmI.h"

class CDependencyWhoAmI : public IWhoAmI
{
public:
	const char* TellWhoAmI() override;
};
