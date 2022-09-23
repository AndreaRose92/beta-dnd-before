import React from "react";
import { savingThrows } from "../../data/skills";
import { SavingThrow } from "../../styles/CharacterSheetGrids.style";

export const SavingThrows = ({ isProficient, skillProficiency }) => {
    const renderSaves = savingThrows.map((save) => {
      return (
        <React.Fragment key={save.name}>
          <div>
            <div>{isProficient(save.name) ? '●' : '○'} </div>
          </div>
          <div>
            <h3>{`${save.stat.slice(0, 3)} ${skillProficiency(
              save.name,
              save.stat
            )}`}</h3>
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