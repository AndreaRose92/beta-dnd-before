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
                    <input type='text' name='name' defaultValue={newCharacter.name} onChange={formHandlers.handleInput} /><br/>
               </label>
               <label>Level: 
                    <input type='number' name='level' defaultValue={newCharacter.level} onChange={formHandlers.handleInput} /><br/>
               </label>
               <label>Class:
                    <select name='dnd_class' defaultValue={newCharacter.dnd_class} onChange={formHandlers.handleClassChange}>
                         <option value=''>---</option>
                         <option value='barbarian'>Barbarian</option>
                         <option value='bard'>Bard</option>
                         <option value='cleric'>Cleric</option>
                         <option value='druid'>Druid</option>
                         <option value='fighter'>Fighter</option>
                         <option value='monk'>Monk</option>
                         <option value='paladin'>Paladin</option>
                         <option value='ranger'>Ranger</option>
                         <option value='rogue'>Rogue</option>
                         <option value='sorcerer'>Sorcerer</option>
                         <option value='warlock'>Warlock</option>
                         <option value='wizard'>Wizard</option>
                    </select><br/>
               </label>
               <label>Race: 
                    <select name='race' defaultValue={newCharacter.race} onChange={formHandlers.handleInput}>
                         <option value="">---</option>
                         <option value="dragonborn">Dragonborn</option>
                         <option value="dwarf">Dwarf</option>
                         <option value="elf">Elf</option>
                         <option value="gnome">Gnome</option>
                         <option value="half-elf">Half-Elf</option>
                         <option value="half-orc">Half-Orc</option>
                         <option value="halfling">Halfling</option>
                         <option value="human">Human</option>
                         <option value="tiefling">Tiefling</option>
                    </select><br/>
               </label>
               <NavButton path={'../stats'} text={'Next'}/>
          </FormBox>
     )
};