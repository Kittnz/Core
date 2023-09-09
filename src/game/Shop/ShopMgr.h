/*
 * Copyright (C) 2020-2021 Turtle WoW
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef SHOP_MGR_H
#define SHOP_MGR_H

#include "Common.h"
#include "SharedDefines.h"
#include "Platform/Define.h"

class Player;
class QueryResult;

class ShopMgr
{
    public:
        explicit ShopMgr(Player* owner);
        
        static void UpdateBalances(uint32 diff);
        static void UpdateBalanceCallback(QueryResult* result, int dummy);

        void ScheduleBalanceUpdate();
        uint32 GetBalance();
		std::string BuyItem(uint32 itemID);

    private:
        Player* _owner;
        
};

#endif
