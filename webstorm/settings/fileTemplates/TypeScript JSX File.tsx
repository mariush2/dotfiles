import { FC } from 'react';

import { tokens } from '@equinor/eds-tokens';

import styled from 'styled-components';

const { spacings } = tokens;

const Container = styled.div`
    display: flex;
    flex-direction: column;
    gap: ${spacings.comfortable.medium};
`;

const ${NAME}: FC = () => {

    return (
        <Container>
            content
        </Container>
    );
}

export default ${NAME}
