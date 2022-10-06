import React, { useEffect, useState } from 'react'
import { Outlet } from 'react-router-dom'
import { NavButton } from '../hookComponents'
import { IndexButtons, IndexTabs, IndexWrapper } from '../styles/Grids.styles'

export const DndClassIndex = () => {
  
    const [classes, setClasses] = useState([])
  
    useEffect(()=>{
        fetch('/dnd_classes').then(r=>{
            if (r.ok) {
                r.json().then(data=>setClasses(data))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    })

    const tabs = classes.map(dc => {return <React.Fragment key={dc.name}><NavButton path={`./${dc.index}`} text={dc.name}/><br/></React.Fragment>})

    return (
    <IndexWrapper>
        <IndexTabs>
            <IndexButtons><h1>Classes</h1>{tabs}</IndexButtons>
        </IndexTabs>
        <Outlet />
    </IndexWrapper>
  )
}
