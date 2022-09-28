import React, { useEffect, useState } from 'react';
import { useOutletContext } from 'react-router-dom';
import { NavButton } from '../../../hookComponents';
import { FormBox } from '../../../styles';

export const SpellOptions = () => {
	const [formHandlers, formData, newCharacter] = useOutletContext();
	const [display, setDisplay] = useState('none')

	console.log(formData)

	const getSpells = e => {
		e.preventDefault()
		formHandlers.handleSpells(e)
	}

	let spellLevel
	if (display === 'none') {
		spellLevel = <h2>Sorry, No Spells</h2>
	} else if (display === 'cantrip') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 0).name}</h4>
	} else if (display === 'lvl 1') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 1).name}</h4>
	} else if (display === 'lvl 2') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 2).name}</h4>
	} else if (display === 'lvl 3') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 3).name}</h4>
	} else if (display === 'lvl 4') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 4).name}</h4>
	} else if (display === 'lvl 5') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 5).name}</h4>
	} else if (display === 'lvl 6') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 6).name}</h4>
	} else if (display === 'lvl 7') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 7).name}</h4>
	} else if (display === 'lvl 8') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 8).name}</h4>
	} else if (display === 'lvl 9') {
		spellLevel = <h4>{formData.availableSpells.find(spell => spell.level === 9).name}</h4>
	}


	return (
		<FormBox>
			<h2>Spells</h2>
			<div>
				<button onClick={()=>setDisplay('cantrip')}>cantrips</button>
				<button onClick={()=>setDisplay('lvl 1')}>lvl 1</button>
				<button onClick={()=>setDisplay('lvl 2')}>lvl 2</button>
				<button onClick={()=>setDisplay('lvl 3')}>lvl 3</button>
				<button onClick={()=>setDisplay('lvl 4')}>lvl 4</button>
				<button onClick={()=>setDisplay('lvl 5')}>lvl 5</button>
				<button onClick={()=>setDisplay('lvl 6')}>lvl 6</button>
				<button onClick={()=>setDisplay('lvl 7')}>lvl 7</button>
				<button onClick={()=>setDisplay('lvl 8')}>lvl 8</button>
				<button onClick={()=>setDisplay('lvl 9')}>lvl 9</button>
			</div>
			{spellLevel}
			<button onClick={getSpells}>Get 'Em</button>
			<NavButton path={'../basic'} text={'back'} />
		</FormBox>
	);
};
