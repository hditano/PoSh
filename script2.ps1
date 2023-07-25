Write-Host 'Hello World'

class Person {
    [String] $FirstName
    [String] $LastName
    [int] $age

    Person([String] $firstName, [String] $lastName, [int32] $age ) {
        $this.FirstName = $firstName
        $this.LastName = $lastName
        $this.age = $age
    }

    [String] GetName() {

        $myObject = [PSCustomObject]@{
            Skill = 'lala'
            EmployeID = 20
            
        }

        return $myObject
    }

    [Employee] GetData() {
        $myData = [Employee]::new('Sql', 12345)
        return $myData
    }
}

class Employee {
    [String] $Skill
    [int] $EmployeeID

    Employee([String] $skill, [int] $employeeid) {
        $this.Skill = $skill
        $this.EmployeeID = $employeeid 
    }
}

function GetWeb {
    Write-Host 'Installing PowerHTML Module'
    Install-Module PowerHTML

    $Response = Invoke-WebRequest -Uri 'https://books.toscrape.com/catalogue/a-light-in-the-attic_1000/index.html'
    $html = ConvertFrom-Html $Response
    $p = $html.SelectNodes('//p') | Where-Object { $_.HasClass('price_color')}
    $myObject = [PSCustomObject]@{
        Price = $p.innerText.Trim("?", " ")
    }
    Write-Host $myObject


}

#$myPerson = [Person]::new('Hernan', 'Di Tano', 23)
#$myPerson.GetName()
#$myPerson.GetData()
GetWeb