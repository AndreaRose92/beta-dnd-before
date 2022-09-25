import styled from "styled-components";

export const PageWrapper = styled.div`
    margin: 0;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 80px calc(100vh - 100px);
    gap: 10px;
`
export const NavWrapper = styled.div`
    display: grid;
    grid-row: 1/2;
    grid-template-columns: 20% 1fr 1fr 1fr 1fr 20%;
    gap: 5px;
    max-height: fit-content;
`

export const ContentWrapper = styled.div`
    margin-top: 50px;
    grid-row: 2;

`

export const CharacterWrapper = styled.div`
    margin: 25px;
    display: grid;
    grid-template-columns: 3fr 1fr;
    grid-template-rows: 1fr 5fr;
`

export const CharacterGrid = styled.div`
    grid-row: 2;
    display: grid;
    grid-template-columns: repeat(12, 110px);
    grid-template-rows: repeat(5, 110px);
    grid-template-areas: 
    'sb sb sb sb sb sb ab ab hb hb hb hb'
    'st st st pb pb pb it ac in dc dc dc'
    'st st st pb pb pb eb eb eb eb eb eb'
    'sn sn sn pb pb pb eb eb eb eb eb eb'
    'sn sn sn pb pb pb eb eb eb eb eb eb'
    ;
    gap: 10px;
    `
export const DiceBox = styled.div`
    grid-column: 2;
    grid-row: 2;
    border-radius: 10px;
    border: 2px outset #d4af37;
    background: radial-gradient(farthest-corner at 5px 5px,
    #fff 0%, #aaa9ad 100%);
    margin: 5px;
    padding: 5px 10px;
    display: grid;
    grid-template-columns: 1fr;
    grid-template-rows: 30px 1fr 1fr 1fr 1fr;

    div.rollBox {
        display: grid;
        grid-template-columns: 4fr 1fr;
        grid-template-rows: 1fr 1fr;
        gap: 5px;
        background-color: darkgray;
        border-radius: 10px;
        height: 90px;
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
        position: fixed;
        top: 78%
    }
`

export const FormGrid = styled.div`
     display: grid;
     grid-template-columns: 100px 1fr 100px;
     grid-template-rows: 60px 1fr;
     justify-content: center;

     h1 {
          grid-column: 2;
          grid-row: 1;
          text-align: center;
     }
`
export const FormBox = styled.form`
     grid-column: 2;
     grid-row: 2;
     justify-self: center;
     
     h2, input, select, button {
          margin: 5px;
          display: block;
     }

`