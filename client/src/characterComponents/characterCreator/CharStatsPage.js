import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';
import { NavButton } from '../../hookComponents';

export const CharStatsPage = () => {

     const [formHandlers, formData] = useOutletContext()

     return (
          <FormBox name='stats' onSubmit={e=>formHandlers.handlePageSubmit(e, 'skills')}>
               <h2>Stats</h2>
               <label>Strength</label>
               <input type='number' name='strength' defaultValue={formData.stats.Strength} onChange={e=>formHandlers.handleInput(e)}/>
               <label>Dexterity</label>
               <input type='number' name='dexterity' defaultValue={formData.stats.Dexterity} onChange={e=>formHandlers.handleInput(e)}/>
               <label>Constitution</label>
               <input type='number' name='constitution' defaultValue={formData.stats.Constitution} onChange={e=>formHandlers.handleInput(e)}/>
               <label>Intelligence</label>
               <input type='number' name='intelligence' defaultValue={formData.stats.Intelligence} onChange={e=>formHandlers.handleInput(e)}/>
               <label>Wisdom</label>
               <input type='number' name='wisdom' defaultValue={formData.stats.Wisdom} onChange={e=>formHandlers.handleInput(e)}/>
               <label>Charisma</label>
               <input type='number' name='charisma' defaultValue={formData.stats.Charisma} onChange={e=>formHandlers.handleInput(e)}/>
               <NavButton path={'./basics'} text={'Back'}/>
               <button type='submit' name='stats'>Next</button>
          </FormBox>
     )


};
