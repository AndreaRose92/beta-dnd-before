import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles/Grids.styles';
import { NavButton } from '../../tools/Hooks';

export const CharPageTwo = () => {

     const [formHandlers, formData] = useOutletContext()

     return (
          <FormBox>
               <h2>Stats</h2>
               <label>Strength</label>
               <input type='number' name='strength' value={formData.stats.strength} onChange={formHandlers.handleStats}/>
               <label>Dexterity</label>
               <input type='number' name='dexterity' value={formData.stats.dexterity} onChange={formHandlers.handleStats}/>
               <label>Constitution</label>
               <input type='number' name='constitution' value={formData.stats.constitution} onChange={formHandlers.handleStats}/>
               <label>Intelligence</label>
               <input type='number' name='intelligence' value={formData.stats.intelligence} onChange={formHandlers.handleStats}/>
               <label>Wisdom</label>
               <input type='number' name='wisdom' value={formData.stats.wisdom} onChange={formHandlers.handleStats}/>
               <label>Charisma</label>
               <input type='number' name='charisma' value={formData.stats.charisma} onChange={formHandlers.handleStats}/>
               <NavButton path={'/test/new_character/basic'} text={'Back'}/>
               <NavButton path={'/test/new_character/skills'} text={'Next'}/>
          </FormBox>
     )


};
