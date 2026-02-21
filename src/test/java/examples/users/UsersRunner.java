package examples.users;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
// mvn clean test -Dtest=UsersRunner -Dkarate.options="--tags @TEST-1"
// mvn clean test -Dtest=UsersRunner -Dkarate.options="--tags @regresion"

// mvn clean test -Dtest=UsersRunner -Dkarate.options="--tags @TEST-1" -Dkarate.env=cert


//mvn archetype:generate -DarchetypeGroupId=io.karatelabs -DarchetypeArtifactId=karate-archetype -DarchetypeVersion=1.5.1 -DgroupId=com.pruebaTecnicaBackend -DartifactId=myprojectBackendEscuelaTesting