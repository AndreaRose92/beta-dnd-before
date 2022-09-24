import { NavButton } from "../tools/Hooks"
import { RaceDetail } from "./RaceDetail"
import { races } from '../data/miscData'

export const RaceIndex = () => {

    const renderRaces = races.map(r => <NavButton key={r} path={`/races/${r.toLowerCase()}`} text={r}><RaceDetail /></NavButton>)

    return (
        <div>
            {renderRaces}
            <NavButton />
        </div>
    )
}