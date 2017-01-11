#pragma once

class IWhoAmI
{
public:
	IWhoAmI();
	virtual ~IWhoAmI();

	virtual const char* TellWhoAmI() = 0;
};
