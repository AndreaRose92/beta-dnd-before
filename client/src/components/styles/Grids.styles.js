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
    grid-row: 1;
    grid-template-columns: 20% 1fr 1fr 1fr 1fr 20%;
    gap: 5px;
`

export const CharacterGrid = styled.div`
    grid-row: 2;
    display: grid;
    grid-template-columns: repeat(12, 110px);
    grid-template-rows: repeat(6, 110px);
    grid-template-areas: 
    'hd hd hd hd hd hd hd hd hd hd hd hd'
    'sb sb sb sb sb sb ab ab hb hb hb hb'
    'st st st pb pb pb it ac in dc dc dc'
    'st st st pb pb pb eb eb eb eb eb eb'
    'sn sn sn pb pb pb eb eb eb eb eb eb'
    'sn sn sn pb pb pb eb eb eb eb eb eb'
    ;
    gap: 10px;
`
