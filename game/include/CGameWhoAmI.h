#pragma once

#include <IWhoAmI.h>

class CGameWhoAmI : public IWhoAmI
{
public:
	const char* TellWhoAmI() override;
};
