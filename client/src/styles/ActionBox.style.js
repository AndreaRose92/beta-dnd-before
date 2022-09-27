import styled from "styled-components";

export const SpellTable = styled.div`
    display: grid;
    grid-template-columns: 3fr 1fr 1fr 1fr 2fr 3fr;
    grid-template-rows: 40px 1fr;
    text-align: center;
`

export const SpellHeader = styled.div`
    grid-row: 1;
`

export const SpellGrid = styled.div`
    grid-row: 2;
`
