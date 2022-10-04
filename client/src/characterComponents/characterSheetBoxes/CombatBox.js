import React from "react";
import { ArmorClass, DefensesConditions, InitiativeBox } from "../../styles";

export const CombatBox = ({ dex }) => {
    return (
      <React.Fragment>
        <InitiativeBox>
          <div>
            <div><h4>INITIATIVE</h4></div>
            <div className='mid'>
              <h2>{dex.modifier > 0 ? `+${dex.modifier}` : dex.modifier}</h2>
            </div>
            <div className='bottom'></div>
          </div>
        </InitiativeBox>
        <ArmorClass>
          <div>
            <div className='top'>ARMOR</div>
            <div className='mid'>
              <h2>{10 + parseInt(dex.modifier)}</h2>
            </div>
            <div className='bottom'>CLASS</div>
          </div>
        </ArmorClass>
        <DefensesConditions>
          <div>
            <div><p>DEFENSES</p></div>
            <div className='mid'></div>
          </div>
          <div>
            <div><p>CONDITIONS</p></div>
            <div className='mid'></div>
            <div className='bottom'></div>
          </div>
        </DefensesConditions>
      </React.Fragment>
    );
  };