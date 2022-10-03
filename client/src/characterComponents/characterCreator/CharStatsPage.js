import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';

export const CharStatsPage = () => {

     const context = useOutletContext()

     return (
          <FormBox>
               <h2>Stats</h2>
               <label>Strength</label>
               <input type='number' name='strength' value={context.stats.strength} onChange={context.handleInput}/>
               <label>Dexterity</label>
               <input type='number' name='dexterity' value={context.stats.dexterity} onChange={context.handleInput}/>
               <label>Constitution</label>
               <input type='number' name='constitution' value={context.stats.constitution} onChange={context.handleInput}/>
               <label>Intelligence</label>
               <input type='number' name='intelligence' value={context.stats.intelligence} onChange={context.handleInput}/>
               <label>Wisdom</label>
               <input type='number' name='wisdom' value={context.stats.wisdom} onChange={context.handleInput}/>
               <label>Charisma</label>
               <input type='number' name='charisma' value={context.stats.charisma} onChange={context.handleInput}/>
          </FormBox>
     )

};
