import React, { useEffect, useState } from 'react'
import { useOutletContext } from 'react-router-dom'
import { NavButton } from '../../hookComponents'
import { FormBox } from '../../styles'

export const CharSpellsPage = () => {
	const [formHandlers, formData] = useOutletContext()
	const [display, setDisplay] = useState('default')

	let spells =  formData.availableSpells
	let level =  formData.maxSpellLevel
	let spellcast =  formData.spellcastingLevel

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