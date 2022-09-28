import React, { useEffect, useState } from 'react'
import { useOutletContext } from 'react-router-dom'
import { NavButton } from '../../hookComponents'
import { FormBox } from '../../styles'

export const SpellOptions = () => {
	const [formHandlers, formData] = useOutletContext()
	const [display, setDisplay] = useState('default')

	let spells =  formData.availableSpells
	let level =  formData.maxSpellLevel
	let spellcast =  formData.spellcastingLevel
	// let spellBuild = newCharacter.level !== null ? {
	// 	level: newCharacter.level,
	// 	dnd_class_id: newCharacter.dnd_class_id,
	// 	race_id: newCharacter.race_id
	// } : null

	// const randNum = (min, max) => {
	// 	return Math.floor(Math.random() * (max - min) + min)
	// }

	// const getSpells = e => {
	// 	e.preventDefault()
	// 	let fetchLevel = randNum(5, 15)
	// 	let fetchClass = [2, 3, 4, 7, 8, 10, 11, 12][randNum(0,8)]
	// 	let fetchRace = randNum(1, 9)
	// 	formHandlers.handleSpells(e)
	// 	fetch('/character_builders', {
	// 		method: "POST",
	// 		headers: {"Content-Type": "application/json"},
	// 		body: JSON.stringify({
	// 			level: fetchLevel,
	// 			dnd_class_id: fetchClass,
	// 			race_id: fetchRace
	// 		})
	// 	}).then(r=>{
	// 		if (r.ok) {
	// 			r.json().then(data=>formHandlers.handleTest(data))
	// 		} else {
	// 			r.json().then(errors=>console.log(errors))
	// 		}
	// 	})
	// }

	const handleDisplay = e => {
		e.preventDefault()
		setDisplay(e.target.value)
	}

	const selectSpell = e => {
		e.preventDefault()
		formHandlers.handleSelect(e)
	}

  return (
	<FormBox>
		<h2>Spell Levels</h2>
		{/* <button onClick={e=>getSpells(e)}>Get Spells</button> */}
		<Buttons level={level} handleDisplay={handleDisplay} spellcast={spellcast}/>
		<h2>Spell Options</h2>
		<SpellMenu display={display} spells={spells} selectSpell={selectSpell} />
		<NavButton path={"../basic"} text={"back"}/>
		<NavButton path={"../review"} text={"next"}/>
	</FormBox>
  )
}

const Buttons = ({level, handleDisplay, spellcast}) => {

	return (
		<div style={{"display": "grid", "gridTemplateRows": "1", "gridTemplateColumns": "repeat(10, 1fr)"}}>
			{spellcast.cantrips_known ? <button value='cantrips' onClick={e=>handleDisplay(e)}>Cantrip</button> : null}
			{level >= 1 ? <button value='lvl_1' onClick={e=>handleDisplay(e)}>lvl 1</button> : null}
			{level >= 2 ? <button value='lvl_2' onClick={e=>handleDisplay(e)}>lvl 2</button> : null}
			{level >= 3 ? <button value='lvl_3' onClick={e=>handleDisplay(e)}>lvl 3</button> : null}
			{level >= 4 ? <button value='lvl_4' onClick={e=>handleDisplay(e)}>lvl 4</button> : null}
			{level >= 5 ? <button value='lvl_5' onClick={e=>handleDisplay(e)}>lvl 5</button> : null}
			{level >= 6 ? <button value='lvl_6' onClick={e=>handleDisplay(e)}>lvl 6</button> : null}
			{level >= 7 ? <button value='lvl_7' onClick={e=>handleDisplay(e)}>lvl 7</button> : null}
			{level >= 8 ? <button value='lvl_8' onClick={e=>handleDisplay(e)}>lvl 8</button> : null}
			{level >= 9 ? <button value='lvl_9' onClick={e=>handleDisplay(e)}>lvl 9</button> : null}
		</div>
	)

}

const SpellMenu = ({display, spells, selectSpell}) => {

	const spellLevel = spells[display]

	const renderSpells = display !== 'default' ? spellLevel.map(spell => {
		return <button key={spell} name={display} value={spell} onClick={selectSpell}>{spell}</button>
	}) : null

	return (
		<div style={{"display": "grid", "gridTemplateColumns": "repeat(10, 1fr)"}}>
			{renderSpells}
		</div>
	)

}