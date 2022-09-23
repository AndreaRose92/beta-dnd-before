import React from "react";
import { skills } from "../../data/skills";
import { ProficiencyBox } from "../../styles/CharacterSheetGrids.style";

export const SkillBox = ({ isProficient, skillProficiency }) => {
    const renderSkills = skills.map((skill) => {
      return (
        <React.Fragment key={skill.name}>
          <h3>{isProficient(skill.name) ? '●' : '○'} </h3>
          <h3>{skill.stat.slice(0, 3)}</h3>
          <h3 className='skill'>{skill.name}</h3>
          <h3>{skillProficiency(skill.name, skill.stat)}</h3>
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