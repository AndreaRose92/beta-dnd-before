import React, { useContext } from "react";
import { savingThrows } from "../../tools/miscData";
import { SavingThrow } from "../../styles/CharacterSheetGrids.style";
import { DiceContext, diceRoll } from "../../tools/PlayerEvents";

export const SavingThrows = ({ isProficient, skillProficiency }) => { 

  const {diceHistory, setDiceHistory} = useContext(DiceContext)
  
  const skillCheck = (skill, mod) => {
    let newRoll = diceRoll(skill, mod)
    if (!diceHistory[0]) { newRoll.id = 1 }
    else { newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
    setDiceHistory(history => [...history,newRoll])
  }

  const renderSaves = savingThrows.map((save) => {
    
    const modifier = skillProficiency(save.name, save.stat)

    return (
        <React.Fragment key={save.name}>
          <div onClick={()=>skillCheck(save.name, modifier)}>
            <div>{isProficient(save.name) ? '●' : '○'} </div>
          </div>
          <div onClick={()=>skillCheck(save.name, modifier)}>
            <h3 className="save" >{`${save.stat.slice(0, 3)} ${modifier}`}</h3>
          </div>
        </React.Fragment>
      );
    });
  
    return (
      <SavingThrow>
        <div>
          <div className='top'>{renderSaves}</div>
          <div className='mid'>
            <p>Saving Throw Modifiers</p>
          </div>
          <div className='bottome'>
            <h4>SAVING THROWS</h4>
          </div>
        </div>
      </SavingThrow>
    );
  };