import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { FormBox } from '../../styles';
import { NavButton } from '../../hookComponents';

export const CharBasicsPage = () => {
	
     const [formHandlers, fromData, newCharacter] = useOutletContext()

     return (
          <FormBox>
               <h2>Basic Info</h2>
               <label>Name: 
                    <input type='text' name='name' value={newCharacter.name} onChange={formHandlers.handleInput} /><br/>
               </label>
               <label>Level: 
                    <input type='number' name='level' value={newCharacter.level} onChange={formHandlers.handleInput} /><br/>
               </label>
               <label>Class:
                    <select name='dnd_class_id' value={newCharacter.dnd_class_id} onChange={formHandlers.handleClassChange}>
                         <option value={0}>---</option>
                         <option value={1}>Barbarian</option>
                         <option value={2}>Bard</option>
                         <option value={3}>Cleric</option>
                         <option value={4}>Druid</option>
                         <option value={5}>Fighter</option>
                         <option value={6}>Monk</option>
                         <option value={7}>Paladin</option>
                         <option value={8}>Ranger</option>
                         <option value={9}>Rogue</option>
                         <option value={10}>Sorcerer</option>
                         <option value={11}>Warlock</option>
                         <option value={12}>Wizard</option>
                    </select><br/>
               </label>
               <label>Race: 
                    <select name='race_id' value={newCharacter.race_id} onChange={formHandlers.handleInput}>
                         <option value={0}>---</option>
                         <option value={1}>Dragonborn</option>
                         <option value={2}>Dwarf</option>
                         <option value={3}>Elf</option>
                         <option value={4}>Gnome</option>
                         <option value={5}>Half-Elf</option>
                         <option value={6}>Half-Orc</option>
                         <option value={7}>Halfling</option>
                         <option value={8}>Human</option>
                         <option value={9}>Tiefling</option>
                    </select><br/>
               </label>
               <NavButton path={'../stats'} text={'Next'}/>
          </FormBox>
     )
};