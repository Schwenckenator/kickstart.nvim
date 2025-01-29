local utils = require 'schwenckenator.luasnippets.utils'

return {
  s(
    {
      name = 'React API',
      trig = 'rapi',
      desc = 'Creates a client API for react',
    },
    fmta(
      [[
        import useClientApi, {
          ICommonRequest,
          ICommonResponse,
          IHookReturnApi,
        } from '@/50_apis/useClientApi'

        export type I<apiType>Request = ICommonRequest & {
          <requestType>
        }

        export type I<apiType>Response = ICommonResponse & {
          <responseType>
        }

        const <filename> = (): IHookReturnApi<<I<apiType>Request, I<apiType>Response>> =>> {
          const processApi = useClientApi<<I<apiType>Request, I<apiType>Response>>()

          return (props) =>>
            processApi({
              url: '<url>',
              method: '<method>',
              ...props,
            })
        }

        export default <filename>
      ]],
      {
        filename = f(utils.filename, {}),
        apiType = f(utils.filenameFilter, {}, { user_args = { 'useClient' } }),
        requestType = i(3),
        responseType = i(4),
        url = i(1),
        method = c(2, {
          t 'get',
          t 'post',
          t 'patch',
          t 'delete',
        }),
      }
    )
  ),
}
