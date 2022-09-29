import React from 'react';
import { useOutletContext } from 'react-router-dom';
import { Error, FormBox } from '../../styles';
import { ErrorContext, NavButton } from '../../hookComponents';
import { useContext } from 'react';

export const CharReviewPage = () => {
	
     const [formHandlers, formData, newCharacter] = useOutletContext()
     const {errors} = useContext(ErrorContext)

     return (
          <FormBox onSubmit={formHandlers.handleSubmit} >
               <h2>Review</h2>
               <table>
                    <tbody>
                         <tr><td>Name</td><td>{newCharacter.name}</td></tr>
                         <tr><td>Class</td><td>{newCharacter.dnd_class_id}</td></tr>
                         <tr><td>Race</td><td>{newCharacter.race_id}</td></tr>
                         <tr><td>Str</td><td>Dex</td><td>Con</td><td>Int</td><td>Wis</td><td>Cha</td></tr>
                         <tr><td>{newCharacter.Strength}</td><td>{newCharacter.Dexterity}</td><td>{newCharacter.Constitution}</td><td>{newCharacter.Intelligence}</td><td>{newCharacter.Wisdom}</td><td>{newCharacter.Charisma}</td></tr>
                         <tr><td>Skills</td></tr>
                         <tr><td>{formData.skillOne}</td></tr>
                         <tr><td>{formData.skillTwo}</td></tr>
                         {formData.skillThree !== '' ? <tr><td>{formData.skillThree}</td></tr> : null}
                         {formData.skillFour !== '' ? <tr><td>{formData.skillFour}</td></tr> : null}
                    </tbody>
               </table>
               <NavButton path={'../skills'} text={'Back'} />
               <button type='submit'>Submit</button>
               {formData.errors ? errors.map(err =>(<Error key={err}>{err}</Error>)) : null}
          </FormBox>
     )
};
