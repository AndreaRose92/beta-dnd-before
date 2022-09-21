import { DndClassDetail } from "./DndClassDetail"
import { NavButton } from "./tools/Hooks"

export const DndClassIndex = () => {
    
    // const [classes, setClasses] = useState([])
    
    // useEffect(()=>{getRequest('/dnd_classes', setClasses)},[])
    const classes = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]

    const renderClasses = classes.map(c => <NavButton key={c} path={`/${c.toLowerCase()}`} text={c}><DndClassDetail /></NavButton>)

    return (
        <div>
            {renderClasses}
            <NavButton />
        </div>
    )
}