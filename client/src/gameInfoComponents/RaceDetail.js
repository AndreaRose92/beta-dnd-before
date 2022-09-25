import { useEffect, useState } from "react"
import { useParams } from "react-router-dom"
import { getRequest } from "../hookComponents/FetchTypes"
import { NavButton, capitalize } from "../hookComponents/Hooks"

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

    useEffect(()=>{getRequest(`/races/${params.race}`, setRace)}, [params.race])

    const renderSubraces = subraces.map(subrace => {
        return (<div key={subrace.id}>
            <h4>{subrace.name}</h4>
            <ul>
                <li>ABI: {subrace.ability_score_bonuses}</li>
                <li>Traits: {subrace.traits}</li>
                {subrace.languages ? <li>Pick One Language: {subrace.languages}</li> : null}
            </ul>
        </div>)
    })

    while (race.name === '') {
        return <div>Loading...</div>
    }

    return (
        <div>
            <h2>{capitalize(race.name)}</h2>
            <ul>
                <li>ABI: {race.ability_score_bonuses}</li>
                <li>Speed: {race.speed}ft</li>
                <li>Size: {race.size}</li>
                <li>Traits: {race.traits}</li>
                <li>Languages: {race.languages}</li>
            </ul>
            {renderSubraces}
            <NavButton path="/races"/>
        </div>
    )

}