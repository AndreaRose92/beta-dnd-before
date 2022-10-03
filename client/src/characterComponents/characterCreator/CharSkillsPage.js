import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';

export const CharSkillsPage = () => {
	
     const context = useOutletContext()

     const skillOptions = context.returnData.skill_options
     const amount = context.returnData.skill_amount
     const maxedOutSkills = amount <= context.skillChoices.length

     const renderSkills = skillOptions.map(skill => {
          const isSelected = context.skillChoices.includes(skill)
          return <button type='button' key={skill} name='skills' disabled={maxedOutSkills && !isSelected} style={isSelected ? {"backgroundColor": "green"} : null} value={skill} onClick={context.handleInput}>{skill}</button>}
     )

     return (
          <FormBox>
               <h3>{`Pick ${amount}`}</h3>
               {renderSkills}
          </FormBox>
     )
};