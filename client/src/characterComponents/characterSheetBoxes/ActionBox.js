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
    } else if (box === 'features') {
        boxType = <All.Specialties/>
    // } else if (box === 'extras') {
    //     boxType = <All.Misc/>
    }

    return (
        <EquipmentBox>
            <div className='eq-box-header'>
                <Button onClick={()=>setBox("features")}>FEATURES</Button>
                <Button onClick={()=>setBox("actions")}>ACTIONS</Button>
                {character.spells ? <Button onClick={()=>setBox("spells")}>SPELLS</Button> : null}
                <Button onClick={()=>setBox("equipment")}>INVENTORY</Button>
                {/* <Button onClick={()=>setBox("extras")}>EXTRAS</Button> */}
            </div>
            {boxType}
        </EquipmentBox>
    )
}