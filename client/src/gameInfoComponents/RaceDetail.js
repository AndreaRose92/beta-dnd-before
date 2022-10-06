import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { capitalize } from "../hookComponents"
import { InfoTab } from "../styles/Grids.styles"

export const RaceDetail = () => {

    const params = useParams()
    const [race, setRace] = useState({
        name: '',
        speed: 0,
        size: '',
        traits: '',
        languages: '',
        ability_score_bonuses: ''
    })

    const subraces = race && race.subraces ? race.subraces : []
    const traits = race && race.traits ? race.traits : []
    
    useEffect(()=>{
        fetch(`/races/${params.race}`).then(r=>{
            if (r.ok) {
                r.json().then(race=>setRace(race))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    }, [params.race])

    const renderTraits = traits.map(trait => {
        return (
            <>
                <h4>{trait.name}</h4>
                <p>{trait.desc}</p>
            </>
        )
    })

    const renderABI = data => {
        let text = ''
        if (data.strength !== 0) {text = `STR +${data.strength}`}
        if (data.dexterity !== 0) {text =  `DEX +${data.dexterity}`}
        if (data.constitution !== 0) {text =  `CON +${data.constitution}`}
        if (data.intelligence !== 0) {text =  `INT +${data.intelligence}`}
        if (data.wisdom !== 0) {text =  `WIS +${data.wisdom}`}
        if (data.charisma !== 0) {text =  `CHA +${data.charisma}`}
        return text
    }

    const renderSubraces = subraces.map(subrace => {
        return (<div key={subrace.id}>
            <h4>{subrace.name}</h4>
            <ul>
                <li>ABI: {renderABI(subrace)}</li>
            </ul>
        </div>)
    })

    while (race.name === '') {
        return <div>Loading...</div>
    }

    return (
        <InfoTab>
            <h1>{capitalize(race.name)}</h1>
            <ul>
                <h2>Basic Info</h2>
                <li>ABI: {renderABI(race)}</li>
                <li>Speed: {race.speed}ft</li>
                <li>Size: {race.size}</li>
                <li>Languages: {race.languages}</li>
            </ul>
            <ul>
                <h2>Traits</h2>
                {renderTraits}
            </ul>
            {renderSubraces}
        </InfoTab>
    )

}