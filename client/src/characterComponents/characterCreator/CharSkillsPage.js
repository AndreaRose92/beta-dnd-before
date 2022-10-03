import React, { useState } from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';
import { NavButton } from '../../hookComponents';

export const CharSkillsPage = () => {
	
     const [formHandlers, formData] = useOutletContext()
     const [chosen, setChosen] = useState([])

     const skillOptions = formData.returnData.skill_options
     const amount = formData.returnData.skill_amount

     const handleClick = e => {
          formHandlers.handleInput(e)
          if (chosen.includes(e.target.value)) {
               setChosen(chosen.filter(skill => skill !== e.target.value))
          } else {
               setChosen([...chosen, e.target.value])
          }
     }

     const renderSkills = skillOptions.map(skill => {
          return <button type='button' key={skill} name='skills' disabled={chosen.length >= amount && !chosen.includes(skill)} value={skill} onClick={e=>handleClick(e)}>{skill}</button>}
     )

     return (
          <FormBox name='skills' onSubmit={e=>formHandlers.handlePageSubmit(e, `spells`)}>
               <h3>{`Pick ${amount}`}</h3>
               {renderSkills}
               <NavButton path={'/new_character/basics'} test={'Back'}/>
               <button name='skills' type='submit'>Next</button>
          </FormBox>
     )
};