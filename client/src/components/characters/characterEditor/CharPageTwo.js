import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles/Grids.styles';
import { NavButton } from '../../tools/Hooks';

export const CharPageTwo = () => {

     const [formHandlers, newCharacter] = useOutletContext()

     return (
          <FormBox>
               <h2>Stats</h2>
               <label>Strength</label>
               <input type='number' name='Strength' value={newCharacter.Strength} onChange={formHandlers.handleStats}/>
               <label>Dexterity</label>
               <input type='number' name='Dexterity' value={newCharacter.Dexterity} onChange={formHandlers.handleStats}/>
               <label>Constitution</label>
               <input type='number' name='Constitution' value={newCharacter.Constitution} onChange={formHandlers.handleStats}/>
               <label>Intelligence</label>
               <input type='number' name='Intelligence' value={newCharacter.Intelligence} onChange={formHandlers.handleStats}/>
               <label>Wisdom</label>
               <input type='number' name='Wisdom' value={newCharacter.Wisdom} onChange={formHandlers.handleStats}/>
               <label>Charisma</label>
               <input type='number' name='Charisma' value={newCharacter.Charisma} onChange={formHandlers.handleStats}/>
               <NavButton path={'/test/new_character/basic'} text={'Back'}/>
               <NavButton path={'/test/new_character/skills'} text={'Next'}/>
          </FormBox>
     )


};
