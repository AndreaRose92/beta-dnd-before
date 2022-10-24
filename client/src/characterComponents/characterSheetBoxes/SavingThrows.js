import React, { useContext } from "react";
import { DetailContext, DiceContext, diceRoll } from "../../hookComponents";
import { SavingThrow } from "../../styles";

export const SavingThrows = ({ saves, prof_bonus }) => { 

  const {diceHistory, setDiceHistory} = useContext(DiceContext)
  const {setDetails} = useContext(DetailContext)
  
  const skillCheck = (skill, mod) => {
    let newRoll = diceRoll(skill, mod)
    if (!diceHistory[0]) { newRoll.id = 1 }
    else { newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
    setDiceHistory(history => [...history,newRoll])
    setDetails(null)
  }

  const renderSaves = saves.map((save) => {
    let mod = save.is_proficient ? save.modifier + prof_bonus : save.modifier
    let displayMod = mod > 0 ? `+${mod}` : mod
    return (
        <React.Fragment key={save.name}>
          <div onClick={()=>skillCheck(save.name, mod)}>
            <div>{save.is_proficient ? '●' : '○'} </div>
          </div>
          <div onClick={()=>skillCheck(save.name)}>
            <h3 className="save" >{`${save.stat.slice(0, 3)} ${displayMod}`}</h3>
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