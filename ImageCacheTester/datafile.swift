//
//  datafile.swift
//  ImageCacheTester
//
//  Created by Administrator on 26/06/23.
//

import Foundation

struct MediaInfo:Codable,Hashable{
    var id = UUID()
    let title:String
    let urlStr:String
}


var dataArray = [
    ["Bulb": "https://unsplash.com/photos/fIq0tET6llw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mnx8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["Pencils":"https://unsplash.com/photos/l3N9Q27zULw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8M3x8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["TV":"https://unsplash.com/photos/UBhpOIHnazM/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NXx8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["Banana":"https://unsplash.com/photos/sf_1ZDA1YFw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NHx8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["Rose":"https://unsplash.com/photos/cNGUw-CEsp0/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8OXx8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["cup":"https://unsplash.com/photos/7Z03R1wOdmI/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8OHx8cmFuZG9tfGVufDB8fHx8MTY4Nzc0ODcxM3ww&force=true"],
     ["Cactus":"https://unsplash.com/photos/fbAnIjhrOL4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTR8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["add banner":"https://unsplash.com/photos/ukzHlkoz1IE/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTF8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["Red clouds":"https://unsplash.com/photos/Hyu76loQLdk/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTJ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["Air ballon":"https://unsplash.com/photos/hpTH5b6mo2s/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTZ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["white mountain":"https://unsplash.com/photos/iRMUDX0kyOc/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTd8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["background":"https://unsplash.com/photos/NkQD-RHhbvY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTV8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["Leaves":"https://unsplash.com/photos/5IHz5WhosQE/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjB8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["coffee cup":"https://unsplash.com/photos/uAk731NvaJo/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTh8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NDg3MTN8MA&force=true"],
     ["fire":"https://unsplash.com/photos/DUXACn8tgp4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjJ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["Puzzle":"https://unsplash.com/photos/3y1zF4hIPCg/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjN8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["Ballon chain":"https://unsplash.com/photos/nptLmg6jqDo/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjZ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["smilies":"https://unsplash.com/photos/pwBlatTLAMA/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjR8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["ice cream cone":"https://unsplash.com/photos/TLD6iCOlyb0/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MjF8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["Opem":"https://unsplash.com/photos/FQgI8AD-BSg/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mjh8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["hand":"https://unsplash.com/photos/YBR-AWm1HQ4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mjl8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["books":"https://unsplash.com/photos/-3wygakaeQc/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MzB8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["crystal rock":"https://unsplash.com/photos/PrQqQVPzmlw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mjd8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["man with sun":"https://unsplash.com/photos/ICE__bo2Vws/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MzR8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["sparkles":"https://unsplash.com/photos/Xaanw0s0pMk/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MzN8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["apple":"https://unsplash.com/photos/co1wmDhPjKg/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MzZ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["dice":"https://unsplash.com/photos/XIIsv6AshJY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MzV8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["change":"https://unsplash.com/photos/mG28olYFgHI/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDJ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["pug":"https://unsplash.com/photos/U5rMrSI7Pn4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mzh8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["couch":"https://unsplash.com/photos/y3dqwY0ePWY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mzl8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["Tea cup":"https://unsplash.com/photos/FBiKcUw_sQw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDB8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTV8MA&force=true"],
     ["coloured flower":"https://unsplash.com/photos/iMdsjoiftZo/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDF8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["space":"https://unsplash.com/photos/oMpAz-DN-9I/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDR8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["empty road":"https://unsplash.com/photos/tMzCrBkM99Y/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDh8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["dead tree":"https://unsplash.com/photos/uPIxW0nhfCw/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDV8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["mask man":"https://unsplash.com/photos/bh4LQHcOcxE/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDZ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["just be nice":"https://unsplash.com/photos/HvG1cGlrA2E/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NTF8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["this must be the place":"https://unsplash.com/photos/GOMhuCj-O9w/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NDd8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["robotic hand":"https://unsplash.com/photos/YJxAy2p_ZJ4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NTZ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["colored monkey":"https://unsplash.com/photos/RAtKWVlfdf4/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NTd8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["astronout":"https://unsplash.com/photos/dBaz0xhCkPY/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NTB8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["pink duck":"https://unsplash.com/photos/m82uh_vamhg/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NTR8fHJhbmRvbXxlbnwwfHx8fDE2ODc3NTMxNTd8MA&force=true"],
     ["rose light orange":"https://unsplash.com/photos/2FdIvx7sy3U/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NjJ8fHJhbmRvbXxlbnwwfHx8fDE2ODc3MDk0OTB8MA&force=true"],
     ["Tools":"https://unsplash.com/photos/Kw_zQBAChws/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NjN8fHJhbmRvbXxlbnwwfHx8fDE2ODc3MDk0OTB8MA&force=true"],
     ["capsules":"https://unsplash.com/photos/yY145j0NdOQ/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mnx8Y2Fwc3VsZXN8ZW58MHx8fHwxNjg4NTQ3MjU0fDA&force=true"]

]

let arrMediaInfo = dataArray.map { dic in
    MediaInfo(title: dic.keys.first ?? "--", urlStr: dic.values.first ?? "")
}

