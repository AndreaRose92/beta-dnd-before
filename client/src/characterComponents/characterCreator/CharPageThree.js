import React, { useEffect } from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';
import { NavButton } from '../../hookComponents';

export const CharPageThree = () => {
	
     const [formHandlers, formData, newCharacter] = useOutletContext()

     useEffect(()=>{formHandlers.handleSpells()}, [newCharacter])

     const filteredSkills = formData.skills.filter(skill => skill.name !== formData.skillOne || skill.name !== formData.skillTwo || skill.name !== formData.skillThree || skill.name !== formData.skillFour)

     const renderSkills = filteredSkills.map(skill => {
          return <option key={Math.random()} value={skill.name}>{skill.name}</option>
     })

     return (
          <FormBox >
               <h2>Skills</h2>
               <select name='skillOne' value={formData.skillOne} onChange={formHandlers.handleSkill}>
                    <option value='default'>---</option>
                    {renderSkills}
               </select>
               <select name='skillTwo' value={formData.skillTwo} onChange={formHandlers.handleSkill}>
                    <option value='default'>---</option>
                    {renderSkills}
               </select>
               {formData.amount >= 3 ? <select name='skillThree' value={formData.skillThree} onChange={formHandlers.handleSkill}>
                    <option value='default'>---</option>
                    {renderSkills}
               </select> : null}
               {formData.amount >= 4 ? <select name='skillFour' value={formData.skillFour} onChange={formHandlers.handleSkill}>
                    <option value='default'>---</option>
                    {renderSkills}
               </select> : null}
               <NavButton path={'../stats'} text={'Back'}/>
               <NavButton path={'../spells'} text={'Next'}/>
          </FormBox>
     )
};