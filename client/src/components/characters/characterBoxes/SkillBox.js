import React, { useContext } from "react";
import { skills } from "../../tools/miscData";
import {DiceContext, diceRoll} from '../../tools/PlayerEvents'
import { ProficiencyBox } from "../../styles/CharacterSheetGrids.style";
import { SkillButton }  from "../../styles/Buttons.style"

export const SkillBox = ({ isProficient, skillProficiency }) => {

  const {diceHistory, setDiceHistory} = useContext(DiceContext)
  
  const skillCheck = (skill, mod) => {
    let newRoll = diceRoll(skill, mod)
    if (!diceHistory[0]) { newRoll.id = 1 }
    else { newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
    setDiceHistory(history => [...history,newRoll])
  }

    const renderSkills = skills.map((skill) => {

      const modifier = skillProficiency(skill.name, skill.stat)

      return (
        <React.Fragment key={skill.name}>
          <h3>{isProficient(skill.name) ? '●' : '○'} </h3>
          <h3>{skill.stat.slice(0, 3)}</h3>
          <h3 className='skill'>{skill.name}</h3>
          <SkillButton onClick={()=>skillCheck(skill.name, modifier)}>{modifier}</SkillButton>
        </React.Fragment>
      );
    });
    return (
      <ProficiencyBox>
        <div className='pro-header'>
          <p>PROF.</p>
          <p>MODIFIER</p>
          <p className='skill'>SKILL</p>
          <p>BONUS</p>
        </div>
        <div className='pro-grid'>{renderSkills}</div>
      </ProficiencyBox>
    );
  };