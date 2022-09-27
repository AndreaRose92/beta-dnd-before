import React, { useContext } from 'react'
import { CharacterContext } from '../../../hookComponents/Hooks'
import { SpellGrid, SpellHeader, SpellTable } from '../../../styles/ActionBox.style'

export const SpellBook = () => {
  
    const {character} = useContext(CharacterContext)
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

    const renderCantrips = cantrips ? cantrips.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl1Spells = lvl_1_spells ? lvl_1_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl2Spells = lvl_2_spells ? lvl_2_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl3Spells = lvl_3_spells ? lvl_3_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl4Spells = lvl_4_spells ? lvl_4_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl5Spells = lvl_5_spells ? lvl_5_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl6Spells = lvl_6_spells ? lvl_6_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl7Spells = lvl_7_spells ? lvl_7_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl8Spells = lvl_8_spells ? lvl_8_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
            )
        }) : null
    const renderLvl9Spells = lvl_9_spells ? lvl_9_spells.map( spell => {
        return (
            <React.Fragment>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
            </React.Fragment>
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
