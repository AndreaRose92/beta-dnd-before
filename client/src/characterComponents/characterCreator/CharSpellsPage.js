import React, { useState } from 'react'
import { useOutletContext } from 'react-router-dom'
import { FormBox } from '../../styles'

export const CharSpellsPage = () => {

	const context = useOutletContext()
	const [display, setDisplay] = useState(0)

	const handleDisplay = e => {
		setDisplay(parseInt(e.target.value))
	}
	let spells = context.returnData.spell_options.filter(spell => spell[1] === display)
	let level =  context.returnData.max_spell_level
	let selectedCantrips = context.cantripChoices
	let selectedSpells = context.spellChoices
	let cantripsKnown = context.returnData.spellcasting_level.cantrips_known
	let spellsKnown = context.returnData.spellcasting_level.spells_known
	const maxedOutSpells = display === 0 ? cantripsKnown <= selectedCantrips.length : spellsKnown <= selectedSpells.length

  return (
	<FormBox>
		<h2>Spell Levels</h2>
		<Buttons display={display} level={level} cantripsKnown={cantripsKnown} handleDisplay={handleDisplay}/>
		<h2>Spell Options</h2>
		<SpellMenu spells={spells} maxedOutSpells={maxedOutSpells} handleInput={context.handleInput} selectedCantrips={selectedCantrips} selectedSpells={selectedSpells} />
	</FormBox>
  )
}

const Buttons = ({display, level, cantripsKnown, handleDisplay}) => {

	return (
		<div style={{"display": "grid", "gridTemplateRows": "1", "gridTemplateColumns": "repeat(10, 1fr)"}}>
		{cantripsKnown ? <button style={display === 0 ? {"backgroundColor": "green"} : null} type='button' value={0} onClick={handleDisplay}>Cantrips</button> : null}
		{level >= 1 ? <button style={display === 1 ? {"backgroundColor": "green"} : null} type='button' value={1} onClick={handleDisplay}>lvl 1</button> : null}
		{level >= 2 ? <button style={display === 2 ? {"backgroundColor": "green"} : null} type='button' value={2} onClick={handleDisplay}>lvl 2</button> : null}
		{level >= 3 ? <button style={display === 3 ? {"backgroundColor": "green"} : null} type='button' value={3} onClick={handleDisplay}>lvl 3</button> : null}
		{level >= 4 ? <button style={display === 4 ? {"backgroundColor": "green"} : null} type='button' value={4} onClick={handleDisplay}>lvl 4</button> : null}
		{level >= 5 ? <button style={display === 5 ? {"backgroundColor": "green"} : null} type='button' value={5} onClick={handleDisplay}>lvl 5</button> : null}
		{level >= 6 ? <button style={display === 6 ? {"backgroundColor": "green"} : null} type='button' value={6} onClick={handleDisplay}>lvl 6</button> : null}
		{level >= 7 ? <button style={display === 7 ? {"backgroundColor": "green"} : null} type='button' value={7} onClick={handleDisplay}>lvl 7</button> : null}
		{level >= 8 ? <button style={display === 8 ? {"backgroundColor": "green"} : null} type='button' value={8} onClick={handleDisplay}>lvl 8</button> : null}
		{level >= 9 ? <button style={display === 9 ? {"backgroundColor": "green"} : null} type='button' value={9} onClick={handleDisplay}>lvl 9</button> : null}
		</div>
	)

}

const SpellMenu = ({spells, maxedOutSpells, handleInput, selectedCantrips, selectedSpells}) => {

	const renderSpells = spells.map(spell => {
		const isSelected = selectedSpells.includes(spell[0]) || selectedCantrips.includes(spell[0])
		return <button type='button' key={spell[0]} name={spell[1]} value={spell[0]} disabled={maxedOutSpells && !isSelected} style={isSelected ? {"backgroundColor": "green"} : null} onClick={handleInput}>{spell[0]}</button>
	})

	return (
		<div style={{"display": "grid", "gridTemplateColumns": "repeat(10, 1fr)"}}>
			{renderSpells}
		</div>
	)

}