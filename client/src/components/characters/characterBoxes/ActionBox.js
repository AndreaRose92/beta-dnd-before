import { useState } from "react"
import Button from "../../styles/Buttons.style"
import { EquipmentBox } from "../../styles/CharacterSheetGrids.style"

export const ActionBox = () => {
    const [box, setBox] = useState('actions')
    let boxType
    if (box === 'actions') {
        boxType = <ActionGrid />
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

const ActionGrid = () => {
    return (
        <div>
            <h1>Coming Soon....</h1>
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