import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';
import { NavButton } from '../../hookComponents';

export const CharStatsPage = () => {

     const [formHandlers, newCharacter] = useOutletContext()

     return (
          <FormBox>
               <h2>Stats</h2>
               <label>Strength</label>
               <input type='number' name='Strength' defaultValue={newCharacter.Strength} onChange={formHandlers.handleStats}/>
               <label>Dexterity</label>
               <input type='number' name='Dexterity' defaultValue={newCharacter.Dexterity} onChange={formHandlers.handleStats}/>
               <label>Constitution</label>
               <input type='number' name='Constitution' defaultValue={newCharacter.Constitution} onChange={formHandlers.handleStats}/>
               <label>Intelligence</label>
               <input type='number' name='Intelligence' defaultValue={newCharacter.Intelligence} onChange={formHandlers.handleStats}/>
               <label>Wisdom</label>
               <input type='number' name='Wisdom' defaultValue={newCharacter.Wisdom} onChange={formHandlers.handleStats}/>
               <label>Charisma</label>
               <input type='number' name='Charisma' defaultValue={newCharacter.Charisma} onChange={formHandlers.handleStats}/>
               <NavButton path={'/new_character/basic'} text={'Back'}/>
               <NavButton path={'/new_character/skills'} text={'Next'}/>
          </FormBox>
     )


};
