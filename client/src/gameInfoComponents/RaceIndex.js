import React, { useEffect, useState } from 'react'
import { Outlet } from 'react-router-dom'
import { NavButton } from '../hookComponents'
import { IndexButtons, IndexTabs, IndexWrapper } from '../styles/Grids.styles'

export const RaceIndex = () => {
  
    const [races, setRaces] = useState([])

    useEffect(()=>{
        fetch("/races").then(r=>{
            if (r.ok) {
                r.json().then(data=>setRaces(data))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    }, [])
  
    const tabs = races.map(race => {return <React.Fragment key={race.name} ><NavButton path={`./${race.index}`} text={race.name}/><br/></React.Fragment>})

    return (    
    <IndexWrapper>
        <IndexTabs>
            <IndexButtons><h1>Races</h1>{tabs}</IndexButtons>
        </IndexTabs>
        <Outlet />
    </IndexWrapper>
  )
}
