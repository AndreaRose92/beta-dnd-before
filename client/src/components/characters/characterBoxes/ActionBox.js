import { useState } from "react"
import Button from "../../styles/Buttons.style"
import { EquipmentBox } from "../../styles/CharacterSheetGrids.style"
import { diceRoll } from "../../tools/PlayerEvents"

export const ActionBox = ({stats, diceRolls, setDiceRolls}) => {
    const [box, setBox] = useState('actions')
    let boxType
    if (box === 'actions') {
        boxType = <ActionGrid stats={stats} diceRolls={diceRolls} setDiceRolls={setDiceRolls} />
    } else if (box === 'spells') {
        boxType = <SpellBook />
    } else if (box === 'equipment') {
        boxType = <Inventory />
    } else if (box === 'traits') {
        boxType = <Specialties />
    } else if (box === 'extras') {
        boxType = <Misc />
    }

    return (
        <EquipmentBox>
            <div className='eq-box-header'>
                <Button onClick={()=>setBox("actions")}>ACTIONS</Button>
                <Button onClick={()=>setBox("spells")}>SPELLS</Button>
                <Button onClick={()=>setBox("equipment")}>EQUIPMENT</Button>
                <Button onClick={()=>setBox("traits")}>TRAITS</Button>
                <Button onClick={()=>setBox("extras")}>EXTRAS</Button>
            </div>
            {boxType}
        </EquipmentBox>
    )
}

const ActionGrid = ({stats, diceRolls, setDiceRolls}) => {

    const skillCheck = (skill, mod, dSize, amt) => {
        let newRoll = diceRoll(skill, mod, dSize, amt)
        console.log(newRoll)
        if (!diceRolls[0]) {
          newRoll = {id: 1, ...newRoll}
        } else {
          newRoll = {id: (diceRolls[diceRolls.length - 1].id + 1), ...newRoll}
        }
        setDiceRolls(history => [
          ...history,
          newRoll
        ])
      }

    return (
        <div>
            <h1 onClick={()=>skillCheck("sword", stats[0].modifier, 8, 4)} >Sword Attack</h1>
        </div>
    )
}

const SpellBook = () => {
    return (
        <div>
            <h1>Rolling scrolls...</h1>
        </div>
    )
}

const Inventory = () => {
    return (
        <div>
            <h1>Stocking up...</h1>
        </div>
    )
}

const Specialties = () => {
    return (
        <div>
            <h1>Sizing up...</h1>
        </div>
    )
}

const Misc = () => {
    return (
        <div>
            <h2>Look, even I don't know what goes here.</h2>
        </div>
    )
}