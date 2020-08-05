import { ApolloClient, ApolloLink, InMemoryCache } from '@apollo/client';
import { SchemaLink } from '@apollo/client/link/schema';
import { GraphQLSchema } from '../../../lib/vulcan-lib/graphql';
import { apolloCacheVoteablePossibleTypes } from '../../../lib/make_voteable';

// This client is used to prefetch data server side (necessary for SSR)
// It is recreated on every request.
export const createClient = async (context) => {
  const cache = new InMemoryCache({
    possibleTypes: {
      ...apolloCacheVoteablePossibleTypes()
    }
  });
  const schema = GraphQLSchema.getExecutableSchema();
  
  // schemaLink will fetch data directly based on the executable schema
  // context here is the resolver context
  const schemaLink = new SchemaLink({ schema, context });
  const client = new ApolloClient({
    ssrMode: true,
    link: ApolloLink.from([schemaLink]),
    cache,
    assumeImmutableResults: true,
  });
  return client;
};
