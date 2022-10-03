import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';

export const CharReviewPage = () => {
	
     const context = useOutletContext()

     const renderBasics = <>
          <li>{context.basics.name}</li>
          <li>Level {context.basics.level} {context.basics.race} {context.basics.dnd_class}</li>
     </>

     const renderStats = <>
          <li>STR: {context.stats.strength}</li>
          <li>DEX: {context.stats.dexterity}</li>
          <li>CON: {context.stats.constitution}</li>
          <li>INT: {context.stats.intelligence}</li>
          <li>WIS: {context.stats.wisdom}</li>
          <li>CHA: {context.stats.charisma}</li>
     </>

     const renderSkills = context.skillChoices.map(skill => <li key={skill}>{skill}</li>)
     const renderCantrips = context.cantripChoices.map(cantrip => <li key={cantrip}>{cantrip}</li>)
     const renderSpells = context.spellChoices.map(spell => <li key={spell}>{spell}</li>)

     return (
          <FormBox onSubmit={e=>context.handleFullSubmit(e)} >
               <h2>Review</h2>
               <h4>Basics</h4>
               <ul>{renderBasics}</ul>
               <h4>Stats</h4>
               <ul>{renderStats}</ul>
               <h4>Skills</h4>
               <ul>{renderSkills}</ul>
               <h4>Spells</h4>
               <ul>{renderCantrips}</ul>
               <ul>{renderSpells}</ul>
               <button type='submit'>Submit</button>
          </FormBox>
     )
};
