struct PSIN
{
    float4 PositionWS   : SV_POSITION;
    float2 TexCoords    : TEXCOORD0;
    float4 Color        : COLOR0;
};

float4 main(PSIN Input) : SV_TARGET
{
    return Input.Color;
}
