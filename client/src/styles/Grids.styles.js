import styled from "styled-components";
import { StatBox } from "./CharacterSheetGrids.style";

export const PageWrapper = styled.div`
    margin: 0;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 80px calc(100vh - 100px);
    gap: 10px;
`
export const NavWrapper = styled.div`
    display: grid;
    grid-row: 1;
    grid-template-columns: 20% 1fr 1fr 1fr 1fr 20%;
    gap: 5px;
    max-height: 80px;
`

export const ContentWrapper = styled.div`
    /* margin-top: 50px; */
    grid-row: 2;

`

export const CharacterWrapper = styled.div`
    display: grid;
    grid-template-rows: 1fr 5fr;
    `

export const CharacterFooter = styled.div`
    grid-area: 'ft';
    grid-column: 1 / 14;
    display: block;
    margin-bottom: 35px;
    border-top: 2px solid black;
    border-bottom: 2px solid black;
    background-color: ${props => {
        switch (props.variant) {
            case 'Barbarian': return '#B87333';
            case 'Bard': return '#B990BA';
            case 'Cleric': return '#AAABAD';
            case 'Druid': return '#8A9453';
            case 'Fighter': return '#674A37';
            case 'Monk': return '#6DB7D5';
            case 'Paladin': return '#B49E53';
            case 'Ranger': return '#4E8062';
            case 'Rogue': return '#4A4B45';
            case 'Sorcerer': return '#C1525B';
            case 'Warlock': return '#8253B1';
            case 'Wizard': return '#2C5EB5';
            default: return 'gray'
        }
    }};
`

export const CharacterGrid = styled.div`
    grid-row: 2;
    display: grid;
    grid-template-columns: repeat(12, 110px) 1fr;
    grid-template-rows: repeat(6, 110px);
    grid-template-areas: 
    'sb sb sb sb sb sb ab ab hb hb hb hb dl'
    'st st st pb pb pb it ac in dc dc dc dl'
    'st st st pb pb pb eb eb eb eb eb eb dl'
    'sn sn sn pb pb pb eb eb eb eb eb eb dl'
    'sn sn sn pb pb pb eb eb eb eb eb eb dl'
    'ft ft ft ft ft ft ft ft ft ft ft ft ft'
    ;
    gap: 10px;
    `
export const DiceBox = styled.div`
    grid-row: 1 / 6;
    grid-area: 'dl';
    border-radius: 10px;
    border: 2px outset #d4af37;
    background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
    margin: 5px;
    padding: 5px 10px;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 40px 1fr;
    
    h2 {
        grid-row: 1;
    }

    div.rollContainer {
        grid-row: 2;
        overflow-y: auto;
    }

    div.rollBox {
        display: grid;
        grid-template-columns: 4fr 1fr;
        grid-template-rows: 1fr 1fr;
        gap: 5px;
        background-color: darkgray;
        border-radius: 10px;
        height: 90px;
        margin-bottom: 5px;
    }

    .skillName {
        grid-row: 1;
        grid-column: 1;
        font-size: x-large;
        text-align: center;
        margin-top: 15px;
    }

    .rollCalc {
        margin-top: -20px;
        display: inline-flex;
        grid-column: 1;
        grid-row: 2;
        text-align: center;
        justify-content: center;
    }

    .total {
        grid-column: 2;
        grid-row: 1 / 2;
        margin-top: 15px;
        margin-right: 50px;
    }

    .clear {
        display: flex;
        margin-bottom: 10px;
        position: relative;
        justify-self: center;
        width: 200px;
        font-size: larger;
    }
`

export const UserWrapper = styled.div`
    display: grid;
    grid-template-rows: 80px 1fr;
    grid-template-columns: 150px 1fr 150px;
    text-align: center;

    h2 {
        grid-column: 2;
    }
`

export const CardWrapper = styled.div`
    grid-row: 2;
    grid-column: 2;
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 15px;
`

export const CharCard = styled.div`
    height: 200px;
    border-radius: 10px;
    border: 1px solid black;
    box-shadow: 2px 2px black;
    display: grid;
    grid-template-columns: 1fr 3fr;
    grid-template-rows: 1fr 1fr;
    background: radial-gradient(
        farthest-side at 0px 0px, #000 0%, 
    ${props => {
        switch (props.variant) {
            case 'Barbarian': return '#B87333';
            case 'Bard': return '#B990BA';
            case 'Cleric': return '#AAABAD';
            case 'Druid': return '#8A9453';
            case 'Fighter': return '#674A37';
            case 'Monk': return '#6DB7D5';
            case 'Paladin': return '#B49E53';
            case 'Ranger': return '#4E8062';
            case 'Rogue': return '#4A4B45';
            case 'Sorcerer': return '#C1525B';
            case 'Warlock': return '#8253B1';
            case 'Wizard': return '#2C5EB5';
            default: return 'gray'
        }
    }} 100%);

    .avatar > img {
        border: black 2px solid;
        grid-row: 1/2;
        grid-column: 1;
        max-height: 100px;
        margin-left: 10%;
        border-radius: 25%;
        margin-top: 10px;
    }


`
export const CharName = styled.div`
    grid-column: 2;
    grid-row: 1;
    display: grid;
    grid-template-rows: 1fr 1fr;
    h3 {
        margin-top: 10%;
    }
`

export const CharButtons = styled.div`
    display: grid;
    grid-column: 2;
    grid-row: 2;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr;

    .edit {
        grid-row: 1;
        grid-column: 1;
        padding: none;
        border-radius: 10px;
        max-height: 30px;
        max-width: 75px;
        justify-self: center;
        margin-top: 30%;
        /* margin-bottom: 50%; */
    }

    .delete {
        grid-row: 1;
        grid-column: 2;
        padding: none;
        border-radius: 10px;
        max-height: 30px;
        max-width: 75px;
        justify-self: center;
        margin-top: 30%;
    }
`

export const EditWrapper = styled.div`
    display: grid;
    grid-template-columns: 100px 1fr 100px;
    grid-template-rows: 60px 1fr;
    text-align: center;
    justify-content: center;

    input, 
    select {
        text-align: center;
        margin-left: 5px;
        margin-bottom: 10px;
        height: 40px;
        width: 300px;
        font-size: large;       
    }
    button {
        height: 50px;
        width: 150px;
        font-size: large;
    }
    h2 {
        grid-row: 1;
        grid-column: 2;
    }
`
export const EditForm = styled.form`
    grid-row: 2;
    grid-column: 2;

`

export const StatForm = styled.div`
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    grid-template-rows: 150px;
    text-align: center;
`

export const EditStatBox = styled(StatBox)`
    
`