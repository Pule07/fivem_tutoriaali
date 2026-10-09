--- tehään tähän auton spawnaus komento.

RegisterCommand("tutorial_auto", function(source, args)

    local autonMalli = args[1] or "futo" -- Tässä ensin tarkistetaan asettiko pelaaja jonkun auton komentoon mukaan, esim BMX. Jos ei niin tulee automaattisesti FUTO
    local hash = GetHashKey(autonMalli)


    if not IsModelInCdimage(hash) then
        return
    end


    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end


    --- Hahmon käsittely
    local ped = PlayerPedId() -- Komennon kirjoittajan hahmo
    local coords = GetEntityCoords(ped) -- Komennon kirjoittajan hahmon koordinaatit



    -- auton luominen
    local auto = CreateVehicle(hash, coords.x,coords.y,coords.z, GetEntityHeading(ped), true, false)

    -- pelaajan asettaminen autoon
    SetPedIntoVehicle(ped,auto,-1)
    SetModelAsNoLongerNeeded(hash)

end)