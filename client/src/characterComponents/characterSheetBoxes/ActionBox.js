import { useState } from "react"
import { Button } from "../../styles"
import { EquipmentBox } from "../../styles"
import * as All from './actionBoxTabs'


export const ActionBox = (character) => {
    const [box, setBox] = useState('actions')
    let boxType
    if (box === 'actions') {
        boxType = <All.ActionTab {...character}/>
    } else if (box === 'spells') {
        boxType = <All.SpellBook {...character}/>
    } else if (box === 'equipment') {
        boxType = <All.Inventory {...character}/>
    } else if (box === 'traits') {
        boxType = <All.Specialties/>
    } else if (box === 'extras') {
        boxType = <All.Misc/>
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