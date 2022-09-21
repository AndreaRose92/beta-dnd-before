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
