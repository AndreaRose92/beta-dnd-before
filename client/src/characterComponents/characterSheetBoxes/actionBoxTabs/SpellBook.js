import React, { useContext } from 'react'
import { CharacterContext, damageTypeIcon, DiceContext, diceRoll } from '../../../hookComponents'
import { SpellGrid, SpellHeader, SpellRow, SpellTable, SpellButton } from '../../../styles'

export const SpellBook = () => {
  
    const {character} = useContext(CharacterContext)
    const {diceHistory, setDiceHistory} = useContext(DiceContext)
    const spellDC = character.spellcasting_modifier ? `+${8 + parseInt(character.spellcasting_modifier)}` : null
    const cantrips = character ? character.cantrips : null
    const lvl_1_spells = character ? character.lvl_1_spells : null
    const lvl_2_spells = character ? character.lvl_2_spells : null
    const lvl_3_spells = character ? character.lvl_3_spells : null
    const lvl_4_spells = character ? character.lvl_4_spells : null
    const lvl_5_spells = character ? character.lvl_5_spells : null
    const lvl_6_spells = character ? character.lvl_6_spells : null
    const lvl_7_spells = character ? character.lvl_7_spells : null
    const lvl_8_spells = character ? character.lvl_8_spells : null
    const lvl_9_spells = character ? character.lvl_9_spells : null


    const spellAttack = (name, modifier, dSize, dAmt) => {
        let newRoll = diceRoll(name, modifier, dSize, dAmt)
        if (!diceHistory[0]) {newRoll.id = 1}
        else {newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
        setDiceHistory(history => [...history, newRoll])
    }

    const cantripIndex = 
        character.level >= 5 ? 
            character.level >= 11 ?
                character.level >= 17 ? 3
            : 2
        : 1
    : 0
    
    const cantripLevel = 
        character.level >= 5 ? 
            character.level >= 11 ?
                character.level >= 17 ? 'lvl_17'
            : 'lvl_11'
        : 'lvl_5'
    : 'lvl_1'

    const renderCantrips = cantrips ? cantrips.map( spell => {
        const damage = spell.damage_at_char_level ? spell.damage_at_char_level[cantripIndex][cantripLevel] : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl1Spells = lvl_1_spells ? lvl_1_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[0].lvl_1 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl2Spells = lvl_2_spells ? lvl_2_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[1].lvl_2 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl3Spells = lvl_3_spells ? lvl_3_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[2].lvl_3 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl4Spells = lvl_4_spells ? lvl_4_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[3].lvl_4 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl5Spells = lvl_5_spells ? lvl_5_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[4].lvl_5 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl6Spells = lvl_6_spells ? lvl_6_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[5].lvl_6 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl7Spells = lvl_7_spells ? lvl_7_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[6].lvl_7 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl8Spells = lvl_8_spells ? lvl_8_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[7].lvl_8 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null
    const renderLvl9Spells = lvl_9_spells ? lvl_9_spells.map( spell => {
        const damage = spell.damage_at_slot_level ? spell.damage_at_slot_level[8].lvl_9 : null
        const damageButton =
            spell.damage_type ?
                <SpellButton onClick={()=>spellAttack(spell.name, character.spellcasting_modifier, damage.split('d')[1],damage.split('d')[0])} >{damage}{damageTypeIcon(spell.damage_type)}</SpellButton>
            : <h4>--</h4>
        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spellDC}{spell.dc}</h4>
                {damageButton}
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
            )
        }) : null


    return (
        <SpellTable>
            <SpellHeader>
                <h3>Name</h3>
                <h3>Time</h3>
                <h3>Range</h3>
                <h3>Hit/DC</h3>
                <h3>Effect</h3>
                <h3>Notes</h3>
            </SpellHeader>
            <SpellGrid>
                {renderCantrips}
                {renderLvl1Spells}
                {renderLvl2Spells}
                {renderLvl3Spells}
                {renderLvl4Spells}
                {renderLvl5Spells}
                {renderLvl6Spells}
                {renderLvl7Spells}
                {renderLvl8Spells}
                {renderLvl9Spells}
            </SpellGrid>
        </SpellTable>
    )


}
